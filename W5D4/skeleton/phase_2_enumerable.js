Array.prototype.myEach = function(cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
};

Array.prototype.myMap = function(cb) {
  let map_arr = [];

  this.myEach(function(el) {
    map_arr.push(cb(el));
  });
  //
  // for (let i = 0; i < this.length; i++) {
  //   var a = cb(this[i]);
  //   map_arr.push(a);
  // }

  return map_arr;
};


Array.prototype.myReduce = function(cb,acc_init) {
  let answer;
  if (acc_init) {
    answer = acc_init;
  }
  else {
    answer = this.shift();
  }
  this.myEach(function(el) {
    answer = cb(answer,el);
  });
      return answer;
};
