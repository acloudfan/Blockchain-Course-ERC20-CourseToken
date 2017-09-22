
var CourseTokenV1 = artifacts.require("./CourseTokenV1.sol");
var CourseTokenV2 = artifacts.require("./CourseTokenV2.sol");
var CourseTokenV3 = artifacts.require("./CourseTokenV3.sol");

module.exports = function(deployer) {
  deployer.deploy(CourseTokenV1, 1000);
  deployer.deploy(CourseTokenV2, 1000);
  deployer.deploy(CourseTokenV3, 1000);
};
