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
].map((s) => JSON.parse(JSON.stringify(s.ast)));

CodeGen.run("Generate.elm", {
  debug: true,
  output: "elmSrc",
  flags: dataTypes,
  cwd: "./codegen",
});
