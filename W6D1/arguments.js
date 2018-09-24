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
  return (...callArgs) => this.apply(ctx, args.concat(callArgs));
};

// notes
// function myBind(fn, ctx, ...args)
//

function curriedSum(numArgs) {
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
      return that.apply(that, args); //why null?
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
  let _warmBench = function(arg){ // are we only passing one at a time?
    args.push(arg);
    if (args.length === numArgs) {
      return that(...args); //why null?
    }else {
      return _warmBench;
    }
  };
  return _warmBench;
};
