var CourseTokenV1 = artifacts.require("./CourseTokenV1.sol");

contract('CourseTokenV1', function(accounts) {

  // Token owner
  var john_address = accounts[0];

  var jane_address = accounts[1];
  var dave_address = accounts[2];

  // Test case
  // 1. Make sure the token supply is initialized correctly (to 1000)
  // 2. John calls transfer to send 100 token to Jane
  // 3. Check Jane' balance it should be 100
  // 4. Check John's balance it should be 900

  // Expected behavior - result is initialized to 10
  // Test Case#1
  it("should assert true", function() {
    var tokenV1;
    return CourseTokenV1.deployed().then(function(instance){
      tokenV1 = instance;
      return tokenV1.totalSupply.call();
    }).then(function (result) {
      console.log("Initial Supply=", result.valueOf());
      //1. Balance should be 1000
      assert.equal(result.valueOf(), 1000, "Token Contract initialized with value NOT equal to 1000!!!");
      //2. John transfers 100 token
      tokenV1.transfer(jane_address, 100,{from: john_address})
      // Check Jane's balance
      return tokenV1.balanceOf.call(jane_address);
    }).then(function(result){
      console.log("Jane's balance=", result.valueOf());
      //3. Jane's Balance should be 100
      assert.equal(result.valueOf(), 100, "Jane's Token Balance NOT equal to 100!!!");
      // Check John's balance
      return tokenV1.balanceOf.call(john_address);
    }).then(function(result){
      console.log("John's balance=", result.valueOf());
      //3. Jane's Balance should be 100
      assert.equal(result.valueOf(), 900, "John's Token Balance NOT equal to 900!!!");
    });
  });
});