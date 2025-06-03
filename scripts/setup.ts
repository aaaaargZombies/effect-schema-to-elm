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
  Data.Result({ error: Data.String, value: Data.Int }),
  Data.Result({
    error: Data.String,
    value: Data.Maybe(Data.List(Data.String)),
  }),
  Data.Result({
    error: Data.String,
    value: Data.Result({
      error: Data.String,
      value: Data.Maybe(Data.List(Data.String)),
    }),
  }),
  Data.Record({
    one: Data.Char,
    two: Data.String,
  }),
  Data.Record({
    a: Data.Char,
    b: Data.Char,
    c: Data.Char,
    d: Data.Char,
    e: Data.Char,
    f: Data.Char,
    g: Data.Char,
    h: Data.Char,
    i: Data.Char,
    j: Data.Char,
  }),
  Data.Record({
    a: Data.Char,
    b: Data.List(Data.Char),
    c: Data.Maybe(Data.Int),
    d: Data.Char,
    e: Data.Char,
    f: Data.Result({
      error: Data.String,
      value: Data.Result({
        error: Data.String,
        value: Data.Maybe(Data.List(Data.String)),
      }),
    }),
    g: Data.Char,
    h: Data.Char,
    i: Data.Record({
      one: Data.Char,
      two: Data.String,
    }),
    j: Data.Float,
  }),
].map((s) => {
  const ast = JSON.parse(JSON.stringify(s.ast));
  const name: string = Utils.astToName(ast);
  const data = Utils.fuzz(100)(s);
  return ["json" + name, data];
});

Utils.printElm("TestData", testData);
