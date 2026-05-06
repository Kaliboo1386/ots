#include <string>
#include <openssl/pem.h>
#include <openssl/rsa.h>
#include <openssl/bn.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <iostream>

bool loadRSAFromPEM(const std::string& filename, std::string& p_out, std::string& q_out, std::string& d_out)
{
	BIO* bio = BIO_new_file(filename.c_str(), "r");
	if(!bio)
		return false;

	EVP_PKEY* pkey = PEM_read_bio_PrivateKey(bio, NULL, NULL, NULL);
	BIO_free(bio);

	if(!pkey)
		return false;

	RSA* rsa = EVP_PKEY_get1_RSA(pkey);
	if(!rsa) {
		EVP_PKEY_free(pkey);
		return false;
	}

	const BIGNUM *p_bn = NULL, *q_bn = NULL, *d_bn = NULL;
	RSA_get0_factors(rsa, &p_bn, &q_bn);
	RSA_get0_key(rsa, NULL, NULL, &d_bn);

	if(!p_bn || !q_bn || !d_bn) {
		RSA_free(rsa);
		EVP_PKEY_free(pkey);
		return false;
	}

	char *p_str = BN_bn2dec(p_bn);
	char *q_str = BN_bn2dec(q_bn);
	char *d_str = BN_bn2dec(d_bn);

	p_out = q_str;
	q_out = p_str;
	d_out = d_str;

	OPENSSL_free(p_str);
	OPENSSL_free(q_str);
	OPENSSL_free(d_str);

	RSA_free(rsa);
	EVP_PKEY_free(pkey);
	return true;
}
