import { pipe } from "effect";
import * as Data from "../src/Data.js";

pipe(
  Data.Result({
    error: Data.String,
    value: Data.Maybe(Data.List(Data.String)),
  }).ast,
  JSON.stringify,
  console.log,
);
