import 'package:demo_app/provider/home_provider.dart';
import 'package:demo_app/shared/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo App')),
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            CustomTextField(
              textEditingController: provider.textController,
              hintText: 'Enter your text to check Profanity',
              validator: (value) {
                if (value == null) return 'Please enter text';
                bool hasProfanity = provider.checkProfanityText(value);
                if (hasProfanity) {
                  return 'Profanity words detected!!!';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Check nudity content of images',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter image url',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              textEditingController: provider.imgUrlController,
              maxLines: 1,
              hintText: 'e.g., https://images.unsplash.com/photo',
              validator: (value) {
                if (value == null) return 'Please enter text';
                bool hasProfanity = provider.checkProfanityText(value);
                if (hasProfanity) {
                  return 'Profanity words detected!!!';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  provider.update();
                }
              },
              suffixIcon: provider.imgUrlController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      onPressed: () {
                        provider.clearControllerValue();
                      },
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                provider.checkImageNudity(context);
              },
              child: provider.loadingUsingUrl
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColor.appWhite,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Check NSFW'),
            ),
          ],
        );
      }),
    );
  }
}
