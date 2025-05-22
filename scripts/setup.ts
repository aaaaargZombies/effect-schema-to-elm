import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";

const testData = [
  // Basics
  Data.Bool,
  Data.Char,
  Data.Float,
  Data.Int,
  Data.String,
  // Containers
  Data.List(Data.String),
  Data.Maybe(Data.Int),
  Data.Maybe(Data.Char),
].map((s) => {
  const ast = JSON.parse(JSON.stringify(s.ast));
  const name: string = Utils.astToName(ast);
  const data = Utils.fuzz(100)(s);
  return ["json" + name, data];
});

Utils.printElm("TestData", testData);
