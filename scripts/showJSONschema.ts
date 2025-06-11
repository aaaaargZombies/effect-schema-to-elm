import { JSONSchema, pipe, Schema } from "effect";
import * as Data from "../src/Data.js";

// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
// const show = (a) => pipe(a, (a) => a.ast, JSON.stringify, console.log);
const show = (a) =>
  pipe(a, (a) => JSONSchema.make(a), JSON.stringify, console.log);

show(
  Data.CustomType(
    "myCustomType",
    {
      _tag: Schema.Literal("two"),
      one: Data.Char,
    },
    {
      _tag: Schema.Literal("two"),
      two: Data.String,
      val: Data.Char,
    },
  ),
);
