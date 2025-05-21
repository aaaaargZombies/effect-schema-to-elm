import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";
import { Effect, pipe, Arbitrary, FastCheck } from "effect";

const arbChar = Arbitrary.make(Data.Char);
const chars = FastCheck.sample(arbChar, 100).filter(
  (c) => !["\\", '"'].includes(c),
);

const arbFloat = Arbitrary.make(Data.Float);
const floats = FastCheck.sample(arbFloat, 100).filter(
  (c) => !["\\", '"'].includes(c),
);

Utils.printElm("TestData", [
  ["floatJson", floats],
  ["charJson", chars],
]);
