const { expect } = require('chai');
const { loadFixture } = require('@nomicfoundation/hardhat-toolbox/network-helpers');
describe('Token contract ', function () {
  async function mix() {
    const [owner, add1, add2] = await ethers.getSigners();
    const hardhatToken = await ethers.deployContract('Token');
    return { owner, add1, add2, hardhatToken };
  }

  it('deployment shou have all tokens', async function () {
    const { owner, hardhatToken } = await loadFixture(mix);

    const ownerBalances = await hardhatToken.balanceOf(owner.address);
    expect(await hardhatToken.total()).to.equal(ownerBalances);
  });

  it('transfer between two account', async function () {
    const { add1, add2, hardhatToken } = await loadFixture(mix);

    await hardhatToken.transfer(add1.address, 100);
    expect(await hardhatToken.balanceOf(add1.address)).to.equal(100);
    await hardhatToken.connect(add1).transfer(add2.address, 50);
    expect(await hardhatToken.balanceOf(add2.address)).to.equal(50);
    expect(await hardhatToken.balanceOf(add1.address)).to.equal(
      await hardhatToken.balanceOf(add2.address)
    );
  });
});
