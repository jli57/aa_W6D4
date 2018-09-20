Array.prototype.uniq = function() {
  const uniqArr = [];

  this.forEach(function(element) {
    if (!uniqArr.includes(element)){
      uniqArr.push(element);
    }
  });
  return uniqArr;
};

Array.prototype.twoSum = function() {
  let sumArray = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        sumArray.push([i,j]);
      }
    }
  }
  return sumArray;
};

Array.prototype.transpose = function() {
  let transposeArray = [];
  for (let i = 0; i < this[0].length; i++) {
    transposeArray.push([]);
  }
  for (let j = 0; j < this.length; j++){
    for(let k = 0; k < this[j].length; k++){
      transposeArray[k].push(this[j][k]);
    }
  }
  return transposeArray;
};
