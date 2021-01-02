const request = require('supertest');
const { server } = require('./index');

describe('App testing', () => {
  afterAll(() => {
    server.close();
  });

  it('tests route', async (done) => {
    const res = await request(server).get('/');
    expect(res.status).toBe(200);
    done();
  });
});
