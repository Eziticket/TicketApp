import fetch from 'node-fetch';

async function run() {
  const mobileNumber = '0556510555';
  const resp = await fetch(
    `https://consumer-smrmapi.hubtel.com/request-money/${mobileNumber}`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Basic ' + Buffer.from('<username>:<password>').toString('base64')
      },
      body: JSON.stringify({
        amount: 1,
        title: 'string',
        description: 'string',
        clientReference: 'string',
        callbackUrl: 'http://example.com',
        cancellationUrl: 'http://example.com',
        returnUrl: 'http://example.com',
        logo: 'http://example.com'
      })
    }
  );

  const data = await resp.json();
  console.log(data);
}

run();import fetch from 'node-fetch';

async function run() {
  const mobileNumber = 'YOUR_mobileNumber_PARAMETER';
  const resp = await fetch(
    `https://consumer-smrmapi.hubtel.com/request-money/${mobileNumber}`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Basic ' + Buffer.from('<username>:<password>').toString('base64')
      },
      body: JSON.stringify({
        amount: 1,
        title: 'string',
        description: 'string',
        clientReference: 'string',
        callbackUrl: 'http://example.com',
        cancellationUrl: 'http://example.com',
        returnUrl: 'http://example.com',
        logo: 'http://example.com'
      })
    }
  );

  const data = await resp.json();
  console.log(data);
}

run();