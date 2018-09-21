function range(start, end) {
  if (start === end){
    return [start];
  }
  else{
    var last_range = range(start, end-1);
    last_range.push(end);
    return last_range;
  }
  return range;
}

function sumRec(arr) {
  if (arr.length == 0) {
    return 0;
  } else {
    return sumRec(arr.slice(0, arr.length - 1)) + arr[arr.length - 1];
  }
}

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  } else {
    return exponent(base, exp - 1) * base;
  }
}

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp === 1) {
    return base;
  } else if (exp % 2 === 0) {
    // even
    return exponent2(base, exp / 2) ** 2;
  } else {
    // odd
    return base * (exponent2(base, (exp - 1) / 2) ** 2);
  }
}

function fibonacci(n) {
  if (n === 0) {
    return [];
  } else if (n === 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  } else {
    let prev_fib = fibonacci(n-1);
    let next_num = prev_fib[prev_fib.length - 2] + prev_fib[prev_fib.length - 1];
    prev_fib.push(next_num);
    return prev_fib;
  }
}

function deepDup(arr) {
  let dup_arr = [];

  arr.forEach(function(el) {
    if (typeof el != "object") {
      dup_arr.push(el);
    } else {
      dup_arr.push(deepDup(el));
    }
  })

  return dup_arr;
}

function bSearch(arr, target) {
  if (arr.length === 0) {
    return -1;
  }
  let midpoint = Math.floor(arr.length / 2);

  if (target === arr[midpoint]) {
    return midpoint;
  } else if (target < arr[midpoint]) {
    return bSearch(arr.slice(0, midpoint), target);
  } else {
    let next = bSearch(arr.slice(midpoint + 1, arr.length), target);

    if (next === -1) {
      return -1;
    } else {
      return midpoint + next + 1;
    }
  }

}
