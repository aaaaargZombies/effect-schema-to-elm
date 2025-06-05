import { pipe, Schema } from "effect";
import * as Data from "../src/Data.js";

// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
const show = (a) => pipe(a, (a) => a.ast, JSON.stringify, console.log);

show(
  Data.CustomType(
    { _tag: Schema.Literal("one"), one: Data.String },
    { _tag: Schema.Literal("two"), one: Data.Char },
  ),
);
