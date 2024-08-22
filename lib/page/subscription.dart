import 'package:flutter/material.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.maxFinite,
            height: 25,
          ),
          Text(
            'Qaho Pro',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            'Access our most advanced AI',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black45),
          ),
          const SizedBox(
            height: 50,
          ),
          const ProTag(
            title: 'Up to 5x more mesage on Qaho-pro and access to  Qaho-pro',
          ),
          const ProTag(
            title: 'Up to 5x more mesage on Qaho-pro and access to  Qaho-pro',
          ),
          const ProTag(
            title: 'Up to 5x more mesage on Qaho-pro and access to  Qaho-pro',
          ),
          const ProTag(
            title: 'Up to 5x more mesage on Qaho-pro and access to  Qaho-pro',
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Subscription',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Auto-renews for \$4/month until canceled',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          FilledButton(onPressed: () {}, child: const Text('Subscribe'))
        ],
      ),
    );
  }
}

class ProTag extends StatelessWidget {
  const ProTag({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.subdirectory_arrow_right_sharp),
      title: Text(title),
    );
  }
}
