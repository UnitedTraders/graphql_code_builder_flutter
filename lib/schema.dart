import "package:code_builder/code_builder.dart";
import "package:graphql_code_builder_flutter/source.dart";
import "package:graphql_code_builder_flutter/src/schema.dart";

Library buildSchemaLibrary(
    SourceNode schemaSource,
    String partUrl,
    Map<String, Reference> typeOverrides,
    EnumFallbackConfig enumFallbackConfig) {
  final lib = buildSchema(
    schemaSource,
    typeOverrides,
    enumFallbackConfig,
  ) as Library;

  return lib.rebuild(
    (b) => b
      ..directives.add(
        Directive.part(partUrl),
      ),
  );
}

class EnumFallbackConfig {
  final bool generateFallbackValuesGlobally;
  final String? globalEnumFallbackName;
  final Map<String, String> fallbackValueMap;

  const EnumFallbackConfig({
    required this.generateFallbackValuesGlobally,
    this.globalEnumFallbackName,
    required this.fallbackValueMap,
  }) : assert(
            !generateFallbackValuesGlobally || globalEnumFallbackName != null);
}
