import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addCommand('create-feature');

  var argResults = parser.parse(arguments);

  if (argResults.command?.name == 'create') {
    createFeatureTemplate(argResults.command?.rest[0] ?? 'new_feature');
  } else {
    print('Unknown command. Use "create-feature" to generate a new feature template.');
  }
}

void createFeatureTemplate(String featureName) {
  final featurePath = 'lib/features/$featureName';
  final directories = [
    '$featurePath/bloc',
    '$featurePath/repository',
    '$featurePath/view',
  ];

  for (var dir in directories) {
    Directory(dir).createSync(recursive: true);
    print('Created: $dir');
  }
  print('Feature template for "$featureName" created successfully.');
}
