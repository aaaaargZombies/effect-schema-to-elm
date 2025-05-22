import { Schema } from "effect";
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
  Data.Maybe(Data.Int),
  Data.Maybe(Data.Char),
].map((s) => {
  const ast = JSON.parse(JSON.stringify(s.ast));
  const name: string = Utils.astToName(ast);
  const data = Utils.fuzz(100)(s)((cs) => {
    // TODO - find better solution for this
    // guard against some weird stuff that seems to break JSON parsing
    if (name === "Char") {
      return cs.filter((c) => !["\\", '"'].includes(c));
    }
    if (name === "String") {
      return cs.map((c) => c.replaceAll(/[\\"]/g, ""));
    }

    return cs;
  });
  return ["json" + name, data];
});

Utils.printElm("TestData", testData);
