know whether this package might be useful for them.

## Features


## Getting started

start using the package.

``` bash 
$ flutter pub add wuchuheng_ui
```

## Usage

```dart
import 'package:wuchuheng_ui/wuchuheng_ui.dart';
import 'package:flutter/material.dart';

class DialogDemo  extends StatelessWidget {
  const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
          children: [
              ElevatedButton(onPressed: () => onDialog(context, title: 'dialog'), child: const Text('Show dialog')),
              ElevatedButton(onPressed: () => onDialog(context, title: 'bottomMenu'), child: const Text('Show bottom Menu')),
          ],
      );
  }
}

```

## Additional information

contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
