# Finance Data Skill

Obtiene datos financieros en tiempo real sin necesidad de API keys.

## Herramientas

- **Crypto prices**: BTC, ETH, SOL, etc.
- **Stock indices**: S&P 500, NASDAQ, DJI
- **Forex**: EUR/USD, GBP/USD
- **Acciones**: NVDA, TSLA, AAPL, etc.

## Uso

Usa `exec` para obtener datos:

```bash
# Crypto
curl -s "https://query1.finance.yahoo.com/v8/finance/chart/BTC-USD" | python3 -c "import json,sys; print(json.load(sys.stdin)['chart']['result'][0]['meta']['regularMarketPrice'])"

# Stocks
curl -s "https://query1.finance.yahoo.com/v8/finance/chart/NVDA" -H "User-Agent: Mozilla"

# Indices
curl -s "https://query1.finance.yahoo.com/v8/finance/chart/%5EGSPC"
```

## Ejemplo

```javascript
// Obtener precio BTC
const btc = await exec("curl -s 'https://query1.finance.yahoo.com/v8/finance/chart/BTC-USD' -H 'User-Agent: Mozilla' | python3 -c \"import json,sys; print(json.load(sys.stdin)['chart']['result'][0]['meta']['regularMarketPrice'])\"");
```
