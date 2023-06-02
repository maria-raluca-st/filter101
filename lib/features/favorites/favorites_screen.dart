import 'package:filter101/constants/colour.dart';
import 'package:filter101/constants/text_style.dart';
import 'package:filter101/network/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final SecureStorage _secureStorage = SecureStorage();
  final Map<String, String> categoryLabels = {
    'hateSpeech': 'Hate Speech',
    'negativeContent': 'Negative Content',
    'humor': 'Humor',
    'positiveContent': 'Positive Content',
    'sarcasmExcluding': 'Sarcasm (Excluding)',
    'sarcasmIncluding': 'Sarcasm (Including)',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          'Favorites',
          style: TextStyles.heading(
            color: Colour.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colour.hunterGreen,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Here you can choose your prefered categories:',
                style: TextStyles.heading(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Excluding',
                style: TextStyles.heading(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'The results will be the probabilities that the content will not contain the following categories:',
                  style: TextStyles.subheading(),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  FavoriteButton(
                    label: categoryLabels['hateSpeech']!,
                    storageKey: 'hateSpeech',
                  ),
                  // FavoriteButton(
                  //   label: categoryLabels['negativeContent']!,
                  //   storageKey: 'negativeContent',
                  // ),
                  FavoriteButton(
                    label: categoryLabels['sarcasmExcluding']!,
                    storageKey: 'sarcasmExcluding',
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Including',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'The results will be the probabilities that the content will contain the following categories:',
                  style: TextStyles.subheading(),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: categoryLabels.keys
                    .where((key) =>
                        key != 'hateSpeech' &&
                        key != 'negativeContent' &&
                        key != 'sarcasmExcluding')
                    .map((String key) {
                  return FavoriteButton(
                    label: categoryLabels[key]!,
                    storageKey: key,
                  );
                }).toList(),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final String label;
  final String storageKey;

  const FavoriteButton({
    required this.label,
    required this.storageKey,
  });

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() async {
    bool? isFavorite = await _secureStorage.getBool(widget.storageKey);
    setState(() {
      _isFavorite = isFavorite ?? false;
    });
  }

  void _toggleFavoriteStatus() async {
    bool newStatus = !_isFavorite;
    await _secureStorage.saveBooleanValues(widget.storageKey, newStatus);
    setState(() {
      _isFavorite = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _toggleFavoriteStatus,
      child: Text(
        widget.label,
        style: TextStyle(
          color: _isFavorite ? Colors.white : Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: _isFavorite ? Colour.hunterGreen : Colour.ashGray,
      ),
    );
  }
}
