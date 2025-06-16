import * as Utils from "./utils.js";
import * as TestData from "../src/testData.js";
import { Schema } from "effect";

const testData_ = Object.entries(TestData.mySchemas).map(([name, s]) => {
  const arbs = Utils.fuzz(10)(s);
  const encoder = Schema.encodeSync(s);
  const data = arbs.map((a) => encoder(a));
  return [`${name}Json`, data];
});

Utils.printElm("TestData", testData_);
