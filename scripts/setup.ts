import * as Utils from "./utils.js";
import * as TestData from "../src/testData.js";
import { Schema } from "effect";
import { writeFile } from "fs";

const testData_ = Object.entries(TestData.mySchemas).map(([name, s]) => {
  const arbs = Utils.fuzz(200)(s);
  const encoder = Schema.encodeSync(s);
  const data = arbs.map((a) => encoder(a));
  return [`${name}Json`, data];
});

const testDataJS = testData_.reduce((acc, [name, data]) => {
  acc[name] = data;
  return acc;
}, {});

const testDataElm = Utils.elmFile("TestData", testData_);

// file path assumed run from root of project via npm script
writeFile("./test/tsData.json", JSON.stringify(testDataJS, null, 2), (err) => {
  if (err) {
    console.error("Error writing file", err);
  } else {
    console.log("JSON file written successfully");
  }
});

writeFile("./elmSrc/TestData.elm", testDataElm, (err) => {
  if (err) {
    console.error("Error writing file", err);
  } else {
    console.log("Elm file written successfully");
  }
});
