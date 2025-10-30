# Firestore Database Setup Guide

## 1. Enable Firestore in Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: **bridal-jwell**
3. Click on **Firestore Database** in the left menu
4. Click **Create database**
5. Select **Start in production mode** (we'll add rules next)
6. Choose a location (e.g., `us-central1`)

## 2. Set Up Firestore Security Rules

Go to **Firestore Database → Rules** and paste this:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow anyone to read jewelry items
    match /jewelry_items/{itemId} {
      allow read: if true;
      allow write: if false; // Only admins can write (via Firebase Console)
    }

    // Deny everything else
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
```

## 3. Add Sample Data

### Option A: Using Firebase Console (Manual)

1. Go to **Firestore Database → Data**
2. Click **Start collection**
3. Collection ID: `jewelry_items`
4. Click **Next**
5. Add documents with these fields:

**Document 1:**

```
imageUrl: https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=800
category: Necklaces
title: Golden Bridal Necklace
```

**Document 2:**

```
imageUrl: https://images.unsplash.com/photo-1601121141461-9d6647bca1ed?w=800
category: Earrings
title: Pearl Drop Earrings
```

**Document 3:**

```
imageUrl: https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=800
category: Bangles
title: Traditional Gold Bangles
```

**Document 4:**

```
imageUrl: https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=800
category: Bridal Sets
title: Complete Bridal Set
```

### Option B: Using the App (Programmatically)

Temporarily enable write access in Firestore Rules:

```javascript
match /jewelry_items/{itemId} {
  allow read, write: if true; // TEMPORARY - for testing only
}
```

Then call `addSampleItems()` from your app, then revert the rule back to read-only.

## 4. Data Structure

Each document in `jewelry_items` collection should have:

```json
{
  "imageUrl": "https://example.com/image.jpg",
  "category": "Necklaces|Earrings|Bangles|Bridal Sets",
  "title": "Display title for the item"
}
```

## 5. Adding Real Images

### Using Imgur (Free, Easy)

1. Go to [imgur.com](https://imgur.com)
2. Upload your jewelry images
3. Right-click → Copy image address
4. Use that URL in Firestore

### Using Unsplash (Free Stock Photos)

Search for jewelry on [unsplash.com](https://unsplash.com/s/photos/jewelry)
Use URLs like: `https://images.unsplash.com/photo-ID?w=800`

### Using Firebase Storage (If you prefer)

1. Upload images to Firebase Storage
2. Get download URLs
3. Store those URLs in Firestore

## Categories

Make sure your categories match these exactly:

- `Necklaces`
- `Earrings`
- `Bangles`
- `Bridal Sets`

## Testing

After adding data, run the app:

```bash
flutter run
```

The home screen should now display your jewelry items!
