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
].map((s) => JSON.parse(JSON.stringify(s.ast)));

CodeGen.run("Generate.elm", {
  debug: true,
  output: "generated",
  flags: dataTypes,
  cwd: "./codegen",
});
