function sum () {
  let args = Array.from(arguments);
  let sum = 0;
  args.forEach((num) => {
    sum += num;
  }); 
  return sum;
}

function sum2 (...args) {
  let sum = 0;
  args.forEach(function(num) {
    sum += num;
  }); 
  return sum;
}

Function.prototype.myBind = function (context) {
  let args = Array.from(arguments).slice(1);
  let that = this;
  // object. apply()
  return function(){
    let callArgs = Array.from(arguments);
    return that.apply(context, args.concat(callArgs));
  };
};

Function.prototype.myBind2 = function (ctx, ...args) {
  let that = this;
  return function(...callArgs) {
    return that.apply(ctx, args.concat(callArgs));
  };
};

function curriedSum(numArgs){
  numbers = [];
  let _curriedSum = function(num){
    numbers.push(num);
    let sum;
    if (numbers.length === numArgs){
      sum = 0;
      numbers.forEach((el) => {
        sum += el;
      });
    }
    if (sum || sum === 0){
      return sum;
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
}

Function.prototype.stephCurry = function(numArgs){
  let that = this;
  // let args = Array.from(arguments).slice(1);
  let args = [];
  let _threePointer = function(arg){ // are we only passing one at a time?
    args.push(arg);
    if (args.length === numArgs) {
      return that.apply(null, args); //why null?
    }else {
      return _threePointer;
    }
  };
  return _threePointer;
};

Function.prototype.sethCurry = function(numArgs){
  let that = this;
  // let args = Array.from(arguments).slice(1);
  let args = [];
  let _threePointer = function(arg){ // are we only passing one at a time?
    args.push(arg);
    if (args.length === numArgs) {
      return that.call(null, ...args); //why null?
    }else {
      return _threePointer;
    }
  };
  return _threePointer;
};