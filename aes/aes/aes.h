/*
*   Byte-oriented AES-256 implementation.
*   All lookup tables replaced with 'on the fly' calculations.
*/
#include "support.h"

typedef struct {
  uint8_t key[16];
  uint8_t enckey[16];
  uint8_t deckey[16];
} aes128_context;

void aes128_encrypt_ecb(uint8_t k[16], uint8_t in_buf[16], uint8_t out_buf[16]);

////////////////////////////////////////////////////////////////////////////////
// Test harness interface code.

struct bench_args_t {
  uint8_t k[16];
  uint8_t in_buf[16];
  uint8_t out_buf[16];
};

