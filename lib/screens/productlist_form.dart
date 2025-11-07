import 'package:flutter/material.dart';

class ProductlistForm extends StatefulWidget {
  const ProductlistForm({super.key});

  @override
  State<ProductlistForm> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductlistForm> {
  final _formKey = GlobalKey<FormState>();

  String _productName = "";
  String _description = "";
  double _price = 0.0;
  String _category = "football"; // default
  String _imageUrl = "";
  bool _isFeatured = false;

  final List<String> _categories = [
    'football',
    'basketball',
    'tennis',
    'running',
    'swimming',
  ];

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _productName = "";
      _description = "";
      _price = 0.0;
      _category = "football";
      _imageUrl = "";
      _isFeatured = false;
    });
  }

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https') && uri.hasAbsolutePath;
  }

  void _saveForm() {
    final form = _formKey.currentState;
    if (form == null) return;

    if (form.validate()) {
      form.save();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Product Saved'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Name: $_productName'),
                Text('Price: $_price'),
                Text('Description: $_description'),
                Text('Category: $_category'),
                Text('Featured: ${_isFeatured ? "Yes" : "No"}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // close dialog
                Navigator.of(context).pop(); // close form page
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Create New Product')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                TextFormField(
                  initialValue: _productName,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _productName = value?.trim() ?? "",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter product name';
                    }
                    final len = value.trim().length;
                    if (len < 3) return 'Name must be at least 3 characters';
                    if (len > 100) return 'Name must be at most 100 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Price
                TextFormField(
                  initialValue: _price == 0.0 ? '' : _price.toString(),
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                    prefixText: 'Rp ',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onSaved: (value) {
                    final v = value?.trim() ?? '';
                    _price = double.tryParse(v) ?? 0.0;
                  },
                  validator: (value) {
                    final v = value?.trim() ?? '';
                    if (v.isEmpty) return 'Please enter price';
                    final parsed = double.tryParse(v);
                    if (parsed == null) return 'Price must be a number';
                    if (parsed <= 0) return 'Price must be greater than 0';
                    if (parsed > 10000000) return 'Price too large';
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Description
                TextFormField(
                  initialValue: _description,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                  onSaved: (value) => _description = value?.trim() ?? "",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter description';
                    }
                    final len = value.trim().length;
                    if (len < 10) return 'Description must be at least 10 characters';
                    if (len > 1000) return 'Description too long';
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Thumbnail URL
                TextFormField(
                  initialValue: _imageUrl,
                  decoration: const InputDecoration(
                    labelText: 'Thumbnail URL',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.url,
                  onSaved: (value) => _imageUrl = value?.trim() ?? "",
                  validator: (value) {
                    final v = value?.trim() ?? '';
                    if (v.isEmpty) return 'Please enter thumbnail URL';
                    final uri = Uri.tryParse(v);
                    if (uri == null || !(uri.scheme == 'http' || uri.scheme == 'https')) {
                      return 'Enter a valid http/https URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Category
                DropdownButtonFormField<String>(
                  value: _category,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  items: _categories
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _category = value);
                  },
                  onSaved: (value) => _category = value ?? _category,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please select a category';
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Is Featured
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Is Featured'),
                  value: _isFeatured,
                  onChanged: (val) => setState(() => _isFeatured = val),
                ),
                const SizedBox(height: 16),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveForm,
                        child: const Text(
                          'Save Product',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: _resetForm,
                      child: const Text('Reset'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                        side: const BorderSide(color: Color.fromARGB(255, 169, 2, 2)),
                        backgroundColor: const Color.fromARGB(255, 255, 17, 0)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}