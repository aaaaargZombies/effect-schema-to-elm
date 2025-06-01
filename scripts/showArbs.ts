import { pipe } from "effect";
import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";

// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
pipe(
  Data.Record({
    one: Data.Char,
    two: Data.String,
  }),
  Utils.fuzz(2),
  JSON.stringify,
  console.log,
);
