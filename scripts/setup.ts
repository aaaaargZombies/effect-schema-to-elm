import * as Utils from "./utils.js";
import * as TestData from "../src/testData.js";

const testData_ = Object.entries(TestData.mySchemas).map(([name, s]) => [
  `${name}Json`,
  Utils.fuzz(100)(s),
]);

Utils.printElm("TestData", testData_);
