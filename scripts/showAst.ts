import { pipe } from "effect";
import * as Data from "../src/Data.js";

// pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
pipe(Data.Maybe(Data.String).ast, JSON.stringify, console.log);
