import { pipe, Schema } from "effect";
import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";

const show = (a: Schema.Schema.Any) =>
  pipe(a, Utils.fuzz(5), JSON.stringify, console.log);

show(Data.Tuple3(Data.Bool, Data.Bool, Data.String));
