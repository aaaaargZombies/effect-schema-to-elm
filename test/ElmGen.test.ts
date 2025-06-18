import { describe, expect, it } from "@effect/vitest";
import { Console, Exit, Effect, pipe, Schema, Equal } from "effect";
import * as Utils from "../scripts/utils.js";
// import * as ElmData from "../src/Data.js";
import * as TestData from "../src/testData.js";
import ElmData from "./elmData.json" with { type: "json" };
import TsData from "./tsData.json" with { type: "json" };

describe("Generated Elm decoders and encoders", () => {
  Object.keys(TsData).map((key) => {
    let key_ = key.replace("Json", "");
    it(`${key_} should match between tsData and elmData JSON`, () => {
      pipe(
        Effect.gen(function* () {
          const elmEncoded = yield* pipe(
            TestData.mySchemas[key_],
            Schema.Array,
            Schema.decodeUnknown,
            (decoder) => decoder(ElmData[key]),
            Effect.exit,
          );

          const tsEncoded = yield* pipe(
            TestData.mySchemas[key_],
            Schema.Array,
            Schema.decodeUnknown,
            (decoder) => decoder(TsData[key]),
            Effect.exit,
          );

          const isEqual = Exit.zipWith(elmEncoded, elmEncoded, {
            onFailure: (a) => a,
            onSuccess: (a, b) => Equal.equals(a, b),
          }).pipe(Exit.getOrElse((_) => false));

          expect(Exit.isSuccess(elmEncoded)).toEqual(true);
          expect(Exit.isSuccess(tsEncoded)).toEqual(true);
          expect(isEqual).toEqual(true);
        }),
        // effect.provide(deps),
        Effect.runPromise,
      );
    });
  });
});
