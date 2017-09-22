var CourseTokenV2 = artifacts.require("./CourseTokenV2.sol");

contract('CourseTokenV2', function(accounts) {

  // Token owner
  var john_address = accounts[0];

  var jane_address = accounts[1];
  var dave_address = accounts[2];

  // Test case
  // 1. John calls transfer to send 100 token to Jane
  // 2. John approves() Jane for 50 tokens
  // 3. Jane transferFrom() John 5 tokens to Dave
  // 4. Assert =>
  //           John balance = 1000 - 100 - 5 = 895
  //           Jane balance = 100
  //           Dave balance = 5
  //           Jane's allowance = 45


  // Expected behavior - result is initialized to 10
  // Test Case#1
  it("should assert true", function() {
    var tokenV2;
    return CourseTokenV2.deployed().then(function(instance){
      tokenV2 = instance;
      //1. John transfers 100 token
      tokenV2.transfer(jane_address, 100,{from: john_address})
      //2. John approves Jane for spending 50 tokens
      return tokenV2.approve(jane_address, 50);
      
    }).then(function(result){
      //Jane tranfser John's 5 tokens to Dave
      tokenV2.transferFrom(john_address, dave_address,5, {from: jane_address});

      // Check John's balance
      return tokenV2.balanceOf.call(john_address);
    }).then(function(result){
      console.log("John's balance=", result.valueOf());

      //3. Jane's Balance should be 100
      assert.equal(result.valueOf(), 895, "John's Token Balance NOT equal to 895!!!");
      // Check Jane's balance
      return tokenV2.balanceOf(jane_address);
    }).then(function(result){
      console.log("Jane's balance=", result.valueOf());
      
      //3. Jane's Balance should be 100
      assert.equal(result.valueOf(), 100, "Jane's Token Balance NOT equal to 100!!!");
      // Check Dave's balance
      return tokenV2.balanceOf.call(dave_address);
    }).then(function(result){
      console.log("Dave's balance=", result.valueOf());
      //3. Jane's Balance should be 100
      assert.equal(result.valueOf(), 5, "Dave's Token Balance NOT equal to 5!!!");

      // Check Jane's allowance
      return tokenV2.allowance.call(john_address, jane_address);
    }).then(function(result){
      console.log("Remaining allowance for Jane from John =", result.valueOf());
      //4. Jane's remaining allowance should be 45
      assert.equal(result.valueOf(), 45, "Balance allowance for Jane for John account should be  45!!!");
    });
  });
});