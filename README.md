# Dead Man's Enigma - A windows application for encrypting and decrypting files with AES specification
## Description
A windows application buit with Flutter and adapted for windows with [fluent_ui](https://pub.dev/packages/fluent_ui). The application uses AES encryption and decryption for .txt files only. Unlike other AES implementations the Initialization vector used in Dead Man's Enigma is not random, but rather built from a unique length. This is subject to change in the future to a Initialization vector that is random and unique for all files to strengthen encryption.

The application uses [file_picker](https://pub.dev/packages/file_picker) to help the user select files from their computer. The user can pick one or more files to encrypt and decrypt. Once the user's files have been encrypted/decrypted, they are stored in 'Documents/Dead Man's Enigma Output/'
