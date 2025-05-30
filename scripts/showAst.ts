import { pipe, Schema } from "effect";
import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";

let a = Schema.Option;

pipe(
  Schema.Union(
    Schema.Number,
    Schema.Literal("FART"),
    Schema.Struct({
      _tag: Schema.Literal("Orange"),
      value: Schema.Number,
    }),
    Schema.Struct({
      _tag: Schema.Literal("Green"),
      value: Schema.String,
    }),
    Schema.Struct({
      _tag: Schema.Literal("Red"),
      value: Schema.String,
    }),
  ).ast,
  JSON.stringify,
  console.log,
);

// pipe(
//   Utils.fuzz(12)(Data.Result({ error: Data.String, value: Data.Int })),
//   (arbs) => arbs.map((a) => JSON.stringify(a)),
//   console.log,
// );
