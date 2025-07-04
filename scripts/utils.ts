import { Arbitrary, FastCheck, Schema } from "effect";

export const pojo = (a) => JSON.parse(JSON.stringify(a));

const capitalize = (str: string) => str.charAt(0).toUpperCase() + str.slice(1);

export const astToName = (ast) => {
  const name: string = ast.annotations["Symbol(ElmType)"];
  if (name === "Maybe") {
    return name + astToName(ast.to.typeParameters[0]);
  }
  if (name === "List") {
    return name + astToName(ast.rest[0].type);
  }
  if (name === "Result") {
    return (
      name +
      astToName(ast.to.typeParameters[1]) +
      astToName(ast.to.typeParameters[0])
    );
  }
  if (name === "Record") {
    // console.log(name);
    return (
      name +
      ast.propertySignatures
        .map((signature) => {
          return capitalize(signature.name) + astToName(signature.type);
        })
        .join("")
    );
  }
  // if (name === "Record") {
  //   console.log(name);
  //   return (
  //     name +
  //     ast.propertySignatures
  //       .map(({ name, type_ }) => {
  //         console.log(type_);
  //         return capitalize(name) + astToName(type_);
  //       })
  //       .join("")
  //   );
  // }
  if (ast._tag === "Declaration") {
    return ast.typeParameters.map(astToName).join("");
  }
  return name;
};

const stringify = (s: string) => JSON.stringify(s).replaceAll(/\\/g, "\\\\");

export const fuzz = (n: number) => (schema: Schema.Schema.Any) =>
  FastCheck.sample(Arbitrary.make(schema), n);

const module = (name: string) => `module ${name} exposing (..)\n\n\n`;
const top = (name: string) => `${name} = """`;
const bottom = `    """\n\n\n`;

type Content = [string, any];

export const elmFile = (moduleName: string, expressions: Content[]) => {
  const body = expressions
    .map(([name, content]) =>
      [top(name), stringify(content), bottom].join("\n"),
    )
    .join("\n");
  return module(moduleName) + body;
};

export const printElm = (moduleName: string, expressions: Content[]) => {
  console.log(module(moduleName));
  expressions.forEach(([name, content]) => {
    console.log(top(name));
    console.log(stringify(content));
    console.log(bottom);
  });
};
