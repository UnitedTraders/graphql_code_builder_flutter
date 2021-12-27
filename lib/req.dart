import "package:code_builder/code_builder.dart";
import "package:graphql_code_builder_flutter/source.dart";
import "package:graphql_code_builder_flutter/src/operation/req.dart";

Library buildReqLibrary(
  SourceNode docSource,
  String partUrl,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partUrl))
        ..body.addAll(
          buildOperationReqClasses(
            docSource,
          ),
        ),
    );
