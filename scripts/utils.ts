import { Effect, pipe, Arbitrary, FastCheck, Schema } from "effect";

export const astToName = (ast) => {
  const name: string = ast.annotations["Symbol(ElmType)"];
  if (name === "Maybe") {
    return name + astToName(ast.to.typeParameters[0]);
  }
  return name;
};

export const fuzz =
  // TODO - how to get the continuation function to understand the types of the schema
  (n: number) => (schema: Schema.Schema.Any) => (continuation: (a) => a) => {
    const arb = Arbitrary.make(schema);
    const vals = FastCheck.sample(arb, n);
    return continuation(vals);
  };

const module = (name: string) => `module ${name} exposing (..)\n\n`;
const top = (name: string) => `${name} = """`;
const bottom = `    """\n\n`;

type Content = [string, any];

export const printElm = (moduleName: string, expressions: Content[]) => {
  console.log(module(moduleName));
  // log all the expressions...
  expressions.forEach(([name, content]) => {
    console.log(top(name));
    console.log(JSON.stringify(content));
    console.log(bottom);
  });
};
