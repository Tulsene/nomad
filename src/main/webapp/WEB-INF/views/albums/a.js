/*
 * Copyright 2004-2008 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
dojo.declare("Spring.DefaultEquals", null, {
	equals : function(_1) {
		if (_1.declaredClass && _1.declaredClass == this.declaredClass) {
			return true;
		} else {
			return false;
		}
	}
});

dojo
		.declare(
				"Spring.AjaxEventDecoration",
				[ Spring.AbstractAjaxEventDecoration, Spring.DefaultEquals ],
				{
					constructor : function(_10) {
						this.validationSubscription = null;
						this.connection = null;
						this.allowed = true;
						dojo.mixin(this, _10);
					},
					apply : function() {
						var _11 = dijit.byId(this.elementId) ? dijit
								.byId(this.elementId) : dojo
								.byId(this.elementId);
						if (!_11) {
							console
									.error("Could not apply AjaxEvent decoration.  Element with id '"
											+ this.elementId
											+ "' not found in the DOM.");
						} else {
							this.validationSubscription = dojo.subscribe(
									this.elementId + "/validation", this,
									"_handleValidation");
							this.connection = dojo.connect(_11, this.event,
									this, "submit");
						}
						return this;
					},
					cleanup : function() {
						dojo.unsubscribe(this.validationSubscription);
						dojo.disconnect(this.connection);
					},
					submit : function(_12) {
						if (this.sourceId == "") {
							this.sourceId = this.elementId;
						}
						if (this.formId == "") {
							Spring.remoting.getLinkedResource(this.sourceId,
									this.params, this.popup);
						} else {
							if (this.allowed) {
								Spring.remoting.submitForm(this.sourceId,
										this.formId, this.params);
							}
						}
						dojo.stopEvent(_12);
					},
					_handleValidation : function(_13) {
						if (!_13) {
							this.allowed = false;
						} else {
							this.allowed = true;
						}
					}
				});
dojo
		.declare(
				"Spring.RemotingHandler",
				Spring.AbstractRemotingHandler,
				{
					constructor : function() {
					},
					submitForm : function(_14, _15, _16) {
						var _17 = new Object();
						for ( var key in _16) {
							_17[key] = _16[key];
						}
						var _19 = dojo.byId(_14);
						if (_19 != null) {
							if (_19.value != undefined
									&& _19.type
									&& ("button,submit,reset")
											.indexOf(_19.type) < 0) {
								_17[_14] = _19.value;
							} else {
								if (_19.name != undefined) {
									_17[_19.name] = _19.name;
								} else {
									_17[_14] = _14;
								}
							}
						}
						if (!_17["ajaxSource"]) {
							_17["ajaxSource"] = _14;
						}
						var _1a = dojo.byId(_15);
						var _1b = dojo.string.trim(_1a.method);
						_1b = _1b.length > 0 ? _1b.toUpperCase() : "GET";
						dojo.xhr(_1b, {
							content : _17,
							form : _15,
							handleAs : "text",
							headers : {
								"Accept" : "text/html;type=ajax"
							},
							load : this.handleResponse,
							error : this.handleError
						}, _1b == "POST" ? true : false);
					},
					getLinkedResource : function(_1c, _1d, _1e) {
						this.getResource(dojo.byId(_1c).href, _1d, _1e);
					},
					getResource : function(_1f, _20, _21) {
						dojo.xhrGet({
							url : _1f,
							content : _20,
							handleAs : "text",
							headers : {
								"Accept" : "text/html;type=ajax"
							},
							load : this.handleResponse,
							error : this.handleError,
							modal : _21
						});
					},
					handleResponse : function(_22, _23) {
						var _24 = _23.xhr
								.getResponseHeader("Spring-Redirect-URL");
						var _25 = _23.xhr
								.getResponseHeader("Spring-Modal-View");
						var _26 = ((dojo.isString(_25) && _25.length > 0) || _23.args.modal);
						if (dojo.isString(_24) && _24.length > 0) {
							if (_26) {
								Spring.remoting._renderURLToModalDialog(_24);
								return _22;
							} else {
								if (_24.indexOf("/") >= 0) {
									window.location = window.location.protocol
											+ "//" + window.location.host + _24;
								} else {
									var _27 = window.location.protocol + "//"
											+ window.location.host
											+ window.location.pathname;
									var _28 = _27.lastIndexOf("/");
									_27 = _27.substr(0, _28 + 1) + _24;
									if (_27 == window.location) {
										Spring.remoting.getResource(_27,
												_23.args.content, false);
									} else {
										window.location = _27;
									}
								}
								return _22;
							}
						} else {
							if ((dojo.string.trim(_22).length == 0)
									&& (_23.xhr.status != 204)
									&& (_23.xhr.status != 205)) {
								if (Spring.debug) {
									Spring.remoting
											.showError("Received empty response with no Spring redirect headers. If this is intentional set the response status code to 204 or 205.");
								}
							}
						}
						var _29 = "(?:<script(.|[\n|\r])*?>)((\n|\r|.)*?)(?:</script>)";
						var _2a = [];
						var _2b = new RegExp(_29, "img");
						var _2c = new RegExp(_29, "im");
						var _2d = _22.match(_2b);
						if (_2d != null) {
							for ( var i = 0; i < _2d.length; i++) {
								var _2f = (_2d[i].match(_2c) || [ "", "", "" ])[2];
								_2f = _2f.replace(/<!--/mg, "").replace(
										/\/\/-->/mg, "").replace(
										/<!\[CDATA\[(\/\/>)*/mg, "").replace(
										/(<!)*\]\]>/mg, "");
								_2a.push(_2f);
							}
						}
						_22 = _22
								.replace(_2b,
										"<script> // Original script removed to avoid re-execution </script>");
						if (_26) {
							Spring.remoting._renderResponseToModalDialog(_22);
						} else {
							var _30 = dojo.doc.createElement("span");
							_30.id = "ajaxResponse";
							_30.style.display = "none";
							document.body.appendChild(_30);
							_30.innerHTML = _22;
							var _31 = new dojo.NodeList(_30);
							var _32 = _31.query(">").orphan();
							_31.orphan();
							_32
									.forEach(function(_33) {
										if (_33.id != null && _33.id != "") {
											var _34 = dijit.byId(_33.id) ? dijit
													.byId(_33.id).domNode
													: dojo.byId(_33.id);
											if (!_34) {
												console
														.error("An existing DOM elment with id '"
																+ _33.id
																+ "' could not be found for replacement.");
											} else {
												_34.parentNode.replaceChild(
														_33, _34);
											}
										}
									});
						}
						dojo.forEach(_2a, function(_35) {
							dojo.eval(_35);
						});
						return _22;
					},
					handleError : function(_36, _37) {
						dojo.require("dijit.Dialog");
						console.error("HTTP status code: ", _37.xhr.status);
						if (Spring.debug && _37.xhr.status != 200) {
							var _38 = new dijit.Dialog({
								title : "Ajax Request Error"
							});
							dojo.connect(_38, "hide", _38, function() {
								this.destroyRecursive(false);
							});
							_38.domNode.style.overflow = "auto";
							_38.setContent(_37.xhr.responseText);
							_38.show();
						}
						return _36;
					},
					showError : function(_39) {
						dojo.require("dijit.Dialog");
						var _3a = new dijit.Dialog({
							title : "Error Message"
						});
						dojo.connect(_3a, "hide", _3a, function() {
							this.destroyRecursive(false);
						});
						_3a.domNode.style.width = "500px";
						_3a.setContent(_39);
						_3a.show();
					},
					_renderURLToModalDialog : function(url) {
						Spring.remoting.getResource(url, {}, true);
					},
					_renderResponseToModalDialog : function(_3c) {
						dojo.require("dijit.Dialog");
						var _3d = new dijit.Dialog({});
						_3d.setContent(_3c);
						dojo.connect(_3d, "hide", _3d, function() {
							this.destroyRecursive(false);
						});
						_3d.show();
					}
				});
dojo.declare("Spring.CommandLinkDecoration", [
		Spring.AbstractCommandLinkDecoration, Spring.DefaultEquals ], {
	constructor : function(_3e) {
		dojo.mixin(this, _3e);
	},
	apply : function() {
		var _3f = dojo.byId(this.elementId);
		if (!dojo.hasClass(_3f, "progressiveLink")) {
			var _40 = new dojo.NodeList(_3f);
			_40.addContent(this.linkHtml, "after").orphan("*");
			_3f = dojo.byId(this.elementId);
		}
		_3f.submitFormFromLink = this.submitFormFromLink;
		return this;
	},
	submitFormFromLink : function(_41, _42, _43) {
		var _44 = [];
		var _45 = dojo.byId(_41);
		var _46 = document.createElement("input");
		_46.name = _42;
		_46.value = "submitted";
		_44.push(_46);
		dojo.forEach(_43, function(_47) {
			var _48 = document.createElement("input");
			_48.name = _47.name;
			_48.value = _47.value;
			_44.push(_48);
		});
		dojo.forEach(_44, function(_49) {
			dojo.addClass(_49, "SpringLinkInput");
			dojo.place(_49, _45, "last");
		});
		if ((_45.onsubmit ? !_45.onsubmit() : false) || !_45.submit()) {
			dojo.forEach(_44, function(_4a) {
				_4a.parentNode.removeChild(_4a);
			});
		}
	}
});
dojo.addOnLoad(Spring.initialize);