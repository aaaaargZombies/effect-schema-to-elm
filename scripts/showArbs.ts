import { pipe, Schema } from "effect";
import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";

// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
pipe(
  Data.Tuple3(Data.Bool, Data.Bool, Data.String),
  Utils.fuzz(5),
  JSON.stringify,
  console.log,
);
