import * as CodeGen from "elm-codegen";
import * as TestData from "./testData.js";

const dataTypes = {};

const prep = (s) => JSON.parse(JSON.stringify(s.ast));

for (const key in TestData.mySchemas) {
  dataTypes[key] = prep(TestData.mySchemas[key]);
}

CodeGen.run("Generate.elm", {
  debug: true,
  output: "elmSrc",
  flags: dataTypes,
  cwd: "./codegen",
});
