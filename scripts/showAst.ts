import { pipe } from "effect";
import * as Data from "../src/Data.js";

// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
pipe(
  Data.Result({
    error: Data.String,
    value: Data.Result({
      error: Data.String,
      value: Data.Maybe(Data.List(Data.String)),
    }),
  }),
  (a) => a.ast,
  JSON.stringify,
  console.log,
);
