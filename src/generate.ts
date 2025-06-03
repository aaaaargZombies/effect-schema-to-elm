import * as CodeGen from "elm-codegen";
import * as ElmData from "./Data.js";

const dataTypes = [
  ElmData.Bool,
  ElmData.Char,
  ElmData.Float,
  ElmData.Int,
  ElmData.String,
  ElmData.List(ElmData.String),
  ElmData.Maybe(ElmData.Int),
  ElmData.Maybe(ElmData.Char),
  ElmData.Result({ error: ElmData.String, value: ElmData.Int }),
  ElmData.Result({
    error: ElmData.String,
    value: ElmData.Maybe(ElmData.List(ElmData.String)),
  }),
  ElmData.Result({
    error: ElmData.String,
    value: ElmData.Result({
      error: ElmData.String,
      value: ElmData.Maybe(ElmData.List(ElmData.String)),
    }),
  }),
  ElmData.Record({
    one: ElmData.Char,
    two: ElmData.String,
  }),
  ElmData.Record({
    a: ElmData.Char,
    b: ElmData.Char,
    c: ElmData.Char,
    d: ElmData.Char,
    e: ElmData.Char,
    f: ElmData.Char,
    g: ElmData.Char,
    h: ElmData.Char,
    i: ElmData.Char,
    j: ElmData.Char,
  }),
  ElmData.Record({
    a: ElmData.Char,
    b: ElmData.List(ElmData.Char),
    c: ElmData.Maybe(ElmData.Int),
    d: ElmData.Char,
    e: ElmData.Char,
    f: ElmData.Result({
      error: ElmData.String,
      value: ElmData.Result({
        error: ElmData.String,
        value: ElmData.Maybe(ElmData.List(ElmData.String)),
      }),
    }),
    g: ElmData.Char,
    h: ElmData.Char,
    i: ElmData.Record({
      one: ElmData.Char,
      two: ElmData.String,
    }),
    j: ElmData.Float,
  }),
].map((s) => JSON.parse(JSON.stringify(s.ast)));

CodeGen.run("Generate.elm", {
  debug: true,
  output: "elmSrc",
  flags: dataTypes,
  cwd: "./codegen",
});
