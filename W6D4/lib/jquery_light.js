/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n\n  constructor(elements) {\n    this.elements = elements;\n  }\n\n\n  each(callback) {\n    this.elements.forEach((el) => {\n      callback(el);\n    });\n  }\n\n  html(string=undefined) {\n    if (string === undefined) {\n      // console.log(this.elements[0]);\n      return this.elements[0].innerHTML;\n    } else {\n      this.each((el) => {\n        el.innerHTML = string;\n      });\n      return this;\n    }\n  }\n\n\n  empty() {\n    this.each((el) => {\n      el.innerHTML = \"\";\n    });\n\n    return this;\n  }\n\n  append(thing) {\n    if ( typeof thing === \"string\" ) {\n      this.each((el) => {\n        el.innerHTML += thing;\n      });\n    } else if ( thing instanceof HTMLElement ) {\n      this.each((el) => {\n        el.innerHTML += thing.outerHTML;\n      });\n    } else {\n      this.each((el) => {\n        thing.elements.forEach((el2) => {\n          el.innerHTML += el2.outerHTML;\n        });\n      });\n    }\n    return this;\n  }\n\n  addClass(className) {\n    this.each((el) => {\n      const arr = el.className.split(\" \");\n      if (!arr.includes(className)) {\n        el.className += ' ' + className;\n      }\n    });\n    return this;\n  }\n\n  removeClass(className) {\n    this.each((el) => {\n      const arr = el.className.split(\" \");\n      if (arr.includes(className)) {\n        arr.splice( arr.indexOf(className), 1);\n        el.className = arr.join(\" \");\n      }\n    });\n    return this;\n  }\n\n  attr(attributeName, attributeValue = undefined) {\n    if (attributeValue === undefined) {\n      return this.elements[0].getAttribute(attributeName);\n    } else {\n      this.each((el) => {\n        el.setAttribute(attributeName, attributeValue);\n      });\n    }\n    return this;\n  }\n\n  children() {\n    const returnArr = [];\n    \n    this.each((el) => {\n\n    });\n  }\n\n}\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./lib/dom_node_collection.js\");\n\n$(() => {\n\n  // $(\".list\").css(\"background-color\", \"red\");\n\n\n});\n\n// document.addEventListener(\"DOMContentLoaded\", )\nwindow.$l = function(argument) {\n\n  if ( argument instanceof HTMLElement ) {\n    console.log(\"hi\");\n    return new DOMNodeCollection([argument]);\n  } else {\n    const nodeList = document.querySelectorAll(argument);\n    const array = Array.from(nodeList);\n    return new DOMNodeCollection(array);\n  }\n};\n\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ })

/******/ });