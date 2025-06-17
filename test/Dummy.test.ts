import { describe, expect, it } from "@effect/vitest";
import { Console, Exit, Effect, pipe, Schema } from "effect";
import * as Utils from "../scripts/utils.js";
import * as Data from "../src/Data.js";
import * as TestData from "../src/testData.js";
import EncodedData from "./encodedData.json" with { type: "json" };

describe("Utils", () => {
  it("should pass", () => {
    pipe(
      Effect.gen(function* () {
        const exit = yield* pipe(
          TestData.mySchemas.myDict,
          Schema.Array,
          Schema.decodeUnknown,
          (decoder) => decoder(EncodedData.myDictJson),
          Effect.exit,
        );

        const a = yield* Console.log(
          JSON.stringify(Exit.getOrElse(exit, (_cause) => [])),
        );
        expect(Exit.isSuccess(exit)).toEqual(true);
      }),
      // effect.provide(deps),
      Effect.runPromise,
    );
  });
});
