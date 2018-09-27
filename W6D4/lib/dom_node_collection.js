class DOMNodeCollection {

  constructor(elements) {
    this.elements = elements;
  }


  each(callback) {
    this.elements.forEach((el) => {
      callback(el);
    });
  }

  html(string=undefined) {
    if (string === undefined) {
      // console.log(this.elements[0]);
      return this.elements[0].innerHTML;
    } else {
      this.each((el) => {
        el.innerHTML = string;
      });
      return this;
    }
  }


  empty() {
    this.each((el) => {
      el.innerHTML = "";
    });

    return this;
  }

  append(thing) {
    if ( typeof thing === "string" ) {
      this.each((el) => {
        el.innerHTML += thing;
      });
    } else if ( thing instanceof HTMLElement ) {
      this.each((el) => {
        el.innerHTML += thing.outerHTML;
      });
    } else {
      this.each((el) => {
        thing.elements.forEach((el2) => {
          el.innerHTML += el2.outerHTML;
        });
      });
    }
    return this;
  }

  addClass(className) {
    this.each((el) => {
      const arr = el.className.split(" ");
      if (!arr.includes(className)) {
        el.className += ' ' + className;
      }
    });
    return this;
  }

  removeClass(className) {
    this.each((el) => {
      const arr = el.className.split(" ");
      if (arr.includes(className)) {
        arr.splice( arr.indexOf(className), 1);
        el.className = arr.join(" ");
      }
    });
    return this;
  }

  attr(attributeName, attributeValue = undefined) {
    if (attributeValue === undefined) {
      return this.elements[0].getAttribute(attributeName);
    } else {
      this.each((el) => {
        el.setAttribute(attributeName, attributeValue);
      });
    }
    return this;
  }

  children() {
    const returnArr = [];
    
    this.each((el) => {

    });
  }

}

module.exports = DOMNodeCollection;
