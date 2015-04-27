namespace rb secret

service Obfuscator {

  void ping();

  string obfuscate(1: string sentence);

}
