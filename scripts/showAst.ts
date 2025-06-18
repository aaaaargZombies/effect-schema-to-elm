import { pipe, Schema } from "effect";
import * as Data from "../src/Data.js";

const show = (a: Schema.Schema.Any) =>
  pipe(a, (a) => a.ast, JSON.stringify, console.log);

show(Data.Array(Data.Bool));
