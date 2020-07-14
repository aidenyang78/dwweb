package com.core.comm.util;

public class DesCipher
{
  private static byte[] initVec;
  private static byte[] key;
  private static int[] IP = { 58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4, 62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8, 57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3, 61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7 };

  private static int[] IIP = { 40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23, 63, 31, 38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29, 36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27, 34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17, 57, 25 };

  private static int[] E = { 32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9, 8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17, 16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25, 24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1 };

  private static int[] P = { 16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18, 31, 10, 2, 8, 24, 14, 32, 27, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25 };

  private static int[][] S = { { 14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7, 0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8, 4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0, 15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13 }, { 15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10, 3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5, 0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15, 13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9 }, { 10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8, 13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1, 13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7, 1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12 }, { 7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15, 13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9, 10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4, 3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14 }, { 2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9, 14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6, 4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14, 11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3 }, { 12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11, 10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8, 9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6, 4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13 }, { 4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1, 13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6, 1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2, 6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12 }, { 13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7, 1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2, 7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8, 2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11 } };

  private static int[] PC1 = { 57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36, 63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4 };

  private static int[] PC2 = { 14, 4, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10, 23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2, 41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48, 44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32 };

  private static int[] keySchedule = { 1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1 };
  private static int MODE_IP;
  private static int MODE_IIP;
  private static int MODE_E;
  private static int MODE_P;
  private static int MODE_PC1;
  private static int MODE_PC2;
  private static int[] BIT = { 128, 64, 32, 16, 8, 4, 2, 1 };
  private static int JBIT;

  public DesCipher()
  {
    MODE_IP = 0;
    MODE_IIP = 1;
    MODE_E = 2;
    MODE_P = 3;
    MODE_PC1 = 4;
    MODE_PC2 = 5;
    JBIT = 8;
    initialize("", "");
  }

  public static synchronized String decode(String strSrc)
  {
    StringBuffer strDec = new StringBuffer();
    String strConvertedSrc = NumberingStringToString(strSrc);
    int nLen = strConvertedSrc.length();
    byte[] imsiVec = initVec;
    byte[] imsiResult = new byte[64];
    byte[] j = new byte[8];
    byte[] c = new byte[8];
    for (int i = 0; i < nLen; i++)
    {
      if (i > 0)
        imsiVec = shiftRegister(imsiVec, JBIT, j);
      imsiResult = Des(imsiVec, key);
      for (int n = 0; n < 8; n++) {
        j[n] = imsiResult[n];
      }
      c = toBinary(strConvertedSrc.substring(i, i + 1), 1);
      for (int n = 0; n < 8; n++) {
        c[n] = (byte)(c[n] ^ j[n]);
      }
      strDec.append(binToString(c, 1));
    }

    return strDec.toString();
  }

  public static synchronized String encode(String strSrc)
  {
    StringBuffer strEnc = new StringBuffer(1024);
    int nLen = strSrc.length();
    byte[] imsiVec = initVec;
    byte[] imsiResult = new byte[64];
    byte[] j = new byte[8];
    byte[] c = new byte[8];
    for (int i = 0; i < nLen; i++)
    {
      if (i > 0)
        imsiVec = shiftRegister(imsiVec, JBIT, j);
      imsiResult = Des(imsiVec, key);
      for (int n = 0; n < 8; n++) {
        j[n] = imsiResult[n];
      }
      c = toBinary(strSrc.substring(i, i + 1), 1);
      for (int n = 0; n < 8; n++) {
        c[n] = (byte)(c[n] ^ j[n]);
      }
      strEnc.append(binToNumberingString(c, 1));
    }

    return strEnc.toString();
  }

  private static byte[] shiftRegister(byte[] x, int j, byte[] y)
  {
    byte[] tmp = new byte[64];
    for (int i = 0; i < 64; i++) {
      if (i < j)
        tmp[i] = y[i];
      else
        tmp[i] = x[(i - j)];
    }
    return tmp;
  }

  public static byte[] Des(byte[] oriData, byte[] oriKey)
  {
    byte[] data = oriData;
    byte[] key = oriKey;
    byte[] subKey = new byte[48];
    byte[] imsiKey = new byte[56];
    data = Permutation(data, MODE_IP);
    imsiKey = Permutation(key, MODE_PC1);
    byte[] R = new byte[32];
    byte[] L = new byte[32];
    byte[] expansion = new byte[48];
    byte[] imsiData32 = new byte[32];
    byte[] C = new byte[28];
    byte[] D = new byte[28];
    for (int i = 0; i < 32; i++)
    {
      L[i] = data[i];
      R[i] = data[(i + 32)];
    }

    for (int i = 0; i < 28; i++)
    {
      C[i] = imsiKey[i];
      D[i] = imsiKey[(i + 28)];
    }

    for (int i = 0; i < 16; i++)
    {
      C = leftShift(C, i);
      D = leftShift(D, i);
      for (int k = 0; k < 28; k++)
      {
        imsiKey[k] = C[i];
        imsiKey[(k + 28)] = D[i];
      }

      subKey = Permutation(imsiKey, MODE_PC2);
      expansion = Permutation(R, MODE_E);
      for (int k = 0; k < 48; k++) {
        expansion[i] = (byte)(expansion[i] ^ subKey[i]);
      }
      imsiData32 = SBox(expansion);
      imsiData32 = Permutation(imsiData32, MODE_P);
      for (int k = 0; k < 32; k++) {
        imsiData32[i] = (byte)(R[i] ^ imsiData32[i]);
      }
      L = R;
      R = imsiData32;
    }

    for (int i = 0; i < 32; i++)
    {
      data[i] = R[i];
      data[(i + 32)] = L[i];
    }

    data = Permutation(data, MODE_IIP);
    return data;
  }

  private static byte[] leftShift(byte[] x, int j)
  {
    byte[] temp = new byte[28];
    int n = keySchedule[j];
    int i = 0;
    for (i = 0; i < 28 - n; i++) {
      temp[i] = x[(i + n)];
    }
    if (n == 1)
    {
      temp[i] = x[0];
    }
    else {
      temp[(i++)] = x[0];
      temp[i] = x[1];
    }
    return temp;
  }

  private static byte[] Permutation(byte[] data, int nMode)
  {
    byte[] temp = new byte[64];
    switch (nMode)
    {
    case 0:
      for (int i = 0; i < 64; i++) {
        temp[i] = data[(IP[i] - 1)];
      }
      return temp;
    case 1:
      for (int i = 0; i < 64; i++) {
        temp[i] = data[(IIP[i] - 1)];
      }
      return temp;
    case 2:
      for (int i = 0; i < 48; i++) {
        temp[i] = data[(E[i] - 1)];
      }
      return temp;
    case 3:
      for (int i = 0; i < 32; i++) {
        temp[i] = data[(P[i] - 1)];
      }
      return temp;
    case 4:
      for (int i = 0; i < 56; i++) {
        temp[i] = data[(PC1[i] - 1)];
      }
      return temp;
    case 5:
      for (int i = 0; i < 48; i++) {
        temp[i] = data[(PC2[i] - 1)];
      }
      return temp;
    }
    return null;
  }

  private static byte[] SBox(byte[] data)
  {
    byte[] result = new byte[32];
    byte[] imsiData = data;
    for (int i = 0; i < 8; i++)
    {
      int row = 0;
      row = 2 * imsiData[(i * 6)] + imsiData[(i * 6 + 5)];
      int col = 8 * imsiData[(i * 6 + 1)] + 4 * imsiData[(i * 6 + 2)] + 2 * imsiData[(i * 6 + 3)] + imsiData[(i * 6 + 4)];
      int snum = S[i][(row * 16 + col)];
      int f;
      if ((f = snum & 0x8) == 8)
        result[(i * 4)] = 1;
      else
        result[(i * 4)] = 0;
      if ((f = snum & 0x4) == 4)
        result[(i * 4 + 1)] = 1;
      else
        result[(i * 4 + 1)] = 0;
      if ((f = snum & 0x2) == 2)
        result[(i * 4 + 2)] = 1;
      else
        result[(i * 4 + 2)] = 0;
      if ((f = snum & 0x1) == 1)
        result[(i * 4 + 3)] = 1;
      else {
        result[(i * 4 + 3)] = 0;
      }
    }
    return result;
  }

  public static void initialize(String strVec, String strKey)
  {
    if (strVec == "")
      strVec = "ABCDABCD";
    if (strKey == "")
      strKey = "SUPERKEY";
    initVec = toBinary(strVec, 8);
    key = toBinary(strKey, 8);
  }

  private static byte[] toBinary(String x, int n)
  {
    byte[] binary = new byte[64];
    for (int i = 0; i < n; i++)
    {
      int check = x.charAt(i);
      for (int j = 0; j < 8; j++) {
        if (check >= BIT[j])
        {
          binary[(i * 8 + j)] = 1;
          check -= BIT[j];
        }
        else {
          binary[(i * 8 + j)] = 0;
        }
      }
    }

    return binary;
  }

  private static String binToString(byte[] b, int n)
  {
    StringBuffer temp = new StringBuffer(256);
    for (int i = 0; i < n; i++)
    {
      char ch = (char)(b[(i * 8 + 1)] * 64 + b[(i * 8 + 2)] * 32 + b[(i * 8 + 3)] * 16 + b[(i * 8 + 4)] * 8 + b[(i * 8 + 5)] * 4 + b[(i * 8 + 6)] * 2 + b[(i * 8 + 7)] * 1);
      temp.append(ch);
    }

    return temp.toString();
  }

  private static String binToNumberingString(byte[] b, int n)
  {
    StringBuffer strTemp = new StringBuffer(64);
    for (int i = 0; i < n; i++)
    {
      int nNumber = b[(i * 8 + 1)] * 64 + b[(i * 8 + 2)] * 32 + b[(i * 8 + 3)] * 16 + b[(i * 8 + 4)] * 8 + b[(i * 8 + 5)] * 4 + b[(i * 8 + 6)] * 2 + b[(i * 8 + 7)] * 1;
      if ((nNumber > 99) && (nNumber < 200))
      {
        char cChar = '1';
        nNumber -= 100;
        strTemp.append(cChar);
      }
      else if (nNumber > 199)
      {
        char cChar = '2';
        strTemp.append(cChar);
      }
      else {
        char cChar = '0';
        strTemp.append(cChar);
      }
      if (nNumber < 10)
        strTemp.append("0");
      strTemp.append(nNumber);
    }

    return strTemp.toString();
  }

  private static String NumberingStringToString(String strNumberingString)
  {
    StringBuffer strConvertedBuffer = new StringBuffer(64);
    StringBuffer strConvertingBuffer = new StringBuffer(strNumberingString);
    for (int nNumber = 0; nNumber + 1 < strConvertingBuffer.length(); nNumber += 3)
    {
      char cChar = (char)Integer.parseInt(strConvertingBuffer.substring(nNumber, nNumber + 3));
      strConvertedBuffer.append(cChar);
    }

    return strConvertedBuffer.toString();
  }
}