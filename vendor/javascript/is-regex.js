import*as t from"call-bind/callBound";import*as r from"has-symbols/shams";var e="default"in t?t.default:t;var o="default"in r?r.default:r;var a={};var i=e;var n=o();var f=n&&!!Symbol.toStringTag;var v;var l;var p;var c;if(f){v=i("Object.prototype.hasOwnProperty");l=i("RegExp.prototype.exec");p={};var throwRegexMarker=function(){throw p};c={toString:throwRegexMarker,valueOf:throwRegexMarker};"symbol"===typeof Symbol.toPrimitive&&(c[Symbol.toPrimitive]=throwRegexMarker)}var u=i("Object.prototype.toString");var s=Object.getOwnPropertyDescriptor;var y="[object RegExp]";a=f?function isRegex(t){if(!t||"object"!==typeof t)return false;var r=s(t,"lastIndex");var e=r&&v(r,"value");if(!e)return false;try{l(t,c)}catch(t){return t===p}}:function isRegex(t){return!(!t||"object"!==typeof t&&"function"!==typeof t)&&u(t)===y};var b=a;export default b;

